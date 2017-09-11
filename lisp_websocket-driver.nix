
{ buildLispPackage, stdenv, fetchurl, lisp-project_websocket-driver, 
   lisp_websocket-driver-client, lisp_websocket-driver-server,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_websocket-driver-client lisp_websocket-driver-server  ];
      inherit stdenv;
      systemName = "websocket-driver";
      
      sourceProject = "${lisp-project_websocket-driver}";
      patches = [];
      lisp_dependencies = "${lisp_websocket-driver-client} ${lisp_websocket-driver-server}";
      name = "lisp_websocket-driver-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
