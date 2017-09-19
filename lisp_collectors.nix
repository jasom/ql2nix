
{ buildLispPackage, stdenv, fetchurl, lisp-project_collectors, 
   lisp_symbol-munger, lisp_closer-mop, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_symbol-munger lisp_closer-mop lisp_alexandria  ];
      inherit stdenv;
      systemName = "collectors";
      
      sourceProject = "${lisp-project_collectors}";
      patches = [];
      lisp_dependencies = "${lisp_symbol-munger} ${lisp_closer-mop} ${lisp_alexandria}";
      name = "lisp_collectors-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
