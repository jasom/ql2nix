
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-frame-manager, 
   lisp_local-time, lisp_simple-logger,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_simple-logger  ];
      inherit stdenv;
      systemName = "gamebox-frame-manager";
      
      sourceProject = "${lisp-project_gamebox-frame-manager}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_simple-logger}";
      name = "lisp_gamebox-frame-manager-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
