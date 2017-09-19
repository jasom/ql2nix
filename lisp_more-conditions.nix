
{ buildLispPackage, stdenv, fetchurl, lisp-project_more-conditions, 
   lisp_closer-mop, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_alexandria  ];
      inherit stdenv;
      systemName = "more-conditions";
      
      sourceProject = "${lisp-project_more-conditions}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_alexandria}";
      name = "lisp_more-conditions-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
