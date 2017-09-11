
{ buildLispPackage, stdenv, fetchurl, lisp-project_more-conditions, 
   lisp_alexandria, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_closer-mop  ];
      inherit stdenv;
      systemName = "more-conditions";
      
      sourceProject = "${lisp-project_more-conditions}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_closer-mop}";
      name = "lisp_more-conditions-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
