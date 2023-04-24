# -------------------------------------------------------------------------------------------------
# add ./bin to PATH so the local forge-deploy binary is available
# -------------------------------------------------------------------------------------------------
export PATH := "./bin:" + env_var('PATH')
# -------------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------------
# VERSIONS
# -------------------------------------------------------------------------------------------------
forge-deploy := "0.0.15"
forge-std := "1.5.3"
# -------------------------------------------------------------------------------------------------

_default:
  @just --choose

# example of how to setup forge-deploy as a local binary
default_install := ""
install git=default_install:
    if [ "{{git}}" = "git" ]; then \
        forge install foundry-rs/forge-std@v{{forge-std}};\
        forge install wighawag/forge-deploy@v{{forge-deploy}};\
    else \
        forge install --no-git foundry-rs/forge-std@v{{forge-std}};\
        forge install --no-git wighawag/forge-deploy@v{{forge-deploy}};\
    fi;
    mkdir bin; cd lib/forge-deploy; cargo build --release; cp target/release/forge-deploy ../../bin/;
    ./bin/forge-deploy gen-deployer;

reinstall git="": uninstall (install git)

uninstall:
    rm -Rf lib/forge-deploy || echo "";
    rm -Rf lib/forge-std || echo "";
    rm bin/forge-deploy || echo "";
    rm .crates.toml || echo "";
    rm .crates2.json || echo "";

compile: gen-deployer
    forge build

gen-deployer:
    forge-deploy gen-deployer

export context out:
    forge-deploy export {{context}} {{out}}

sync:
    forge-deploy sync

test: gen-deployer
    forge test


context_RPC_URL_varname := `echo "RPC_URL_${DEPLOYMENT_CONTEXT-}"`
rpc_url := env_var_or_default(context_RPC_URL_varname,env_var_or_default("RPC_URL", ""))

context_DEPLOYER_PRIVATE_KEY_varname := `echo "DEPLOYER_PRIVATE_KEY_${DEPLOYMENT_CONTEXT-}"`
private_key := env_var_or_default(context_DEPLOYER_PRIVATE_KEY_varname,env_var_or_default("DEPLOYER_PRIVATE_KEY", ""))

deploy $DEPLOYMENT_CONTEXT="localhost" +ARGS="": (compile)
    ldenv -n DEPLOYMENT_CONTEXT just _deploy {{ARGS}}
@_deploy +ARGS="":
    if [ "${DEPLOYMENT_CONTEXT}" = "void" ]; then \
        forge script script/Deploy.s.sol --private-key {{private_key}} {{ARGS}};\
    else \
        forge script script/Deploy.s.sol --private-key {{private_key}} --rpc-url {{rpc_url}} --broadcast {{ARGS}} && forge-deploy sync; \
    fi;

run $DEPLOYMENT_CONTEXT path sig +ARGS: (compile)
    ldenv -n DEPLOYMENT_CONTEXT just _run {{path}} "{{sig}}" {{ARGS}}
@_run path sig +ARGS="":
    forge script --private-key {{private_key}} --rpc-url {{rpc_url}} --broadcast {{path}} --sig "{{sig}}" {{ARGS}};


# UTILITY TO load env variable (do not escape parenthesis)
@_load $DEPLOYMENT_CONTEXT +ARGS:
    ldenv -n DEPLOYMENT_CONTEXT just {{ARGS}}


watch:
    watchexec -w script -w src just compile
