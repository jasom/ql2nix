
{ buildLispPackage, stdenv, fetchurl, lisp-project_slack-client, 
   lisp_websocket-driver, lisp_safe-queue, lisp_jonathan, lisp_event-glue, lisp_drakma-async, lisp_cl-async, lisp_babel, lisp_blackbird,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_websocket-driver lisp_safe-queue lisp_jonathan lisp_event-glue lisp_drakma-async lisp_cl-async lisp_babel lisp_blackbird  ];
      inherit stdenv;
      systemName = "slack-client";
      
      sourceProject = "${lisp-project_slack-client}";
      patches = [];
      lisp_dependencies = "${lisp_websocket-driver} ${lisp_safe-queue} ${lisp_jonathan} ${lisp_event-glue} ${lisp_drakma-async} ${lisp_cl-async} ${lisp_babel} ${lisp_blackbird}";
      name = "lisp_slack-client-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
