
{ buildLispPackage, stdenv, fetchurl, lisp-project_lparallel, 
   lisp_bordeaux-threads, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_alexandria  ];
      inherit stdenv;
      systemName = "lparallel";
      
      sourceProject = "${lisp-project_lparallel}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_alexandria}";
      name = "lisp_lparallel-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
