
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-frame-manager, 
   lisp_simple-logger, lisp_local-time,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_simple-logger lisp_local-time  ];
      inherit stdenv;
      systemName = "gamebox-frame-manager";
      
      sourceProject = "${lisp-project_gamebox-frame-manager}";
      patches = [];
      lisp_dependencies = "${lisp_simple-logger} ${lisp_local-time}";
      name = "lisp_gamebox-frame-manager-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
