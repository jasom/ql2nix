
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-ecs, 
   lisp_alexandria, lisp_simple-logger,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_simple-logger  ];
      inherit stdenv;
      systemName = "gamebox-ecs";
      
      sourceProject = "${lisp-project_gamebox-ecs}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_simple-logger}";
      name = "lisp_gamebox-ecs-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
