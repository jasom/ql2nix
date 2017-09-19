
{ buildLispPackage, stdenv, fetchurl, lisp-project_cheat-js, 
   lisp_cl-uglify-js, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-uglify-js lisp_fiveam  ];
      inherit stdenv;
      systemName = "cheat-js";
      
      sourceProject = "${lisp-project_cheat-js}";
      patches = [];
      lisp_dependencies = "${lisp_cl-uglify-js} ${lisp_fiveam}";
      name = "lisp_cheat-js-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
