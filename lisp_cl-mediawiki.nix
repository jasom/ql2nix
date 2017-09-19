
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mediawiki, 
   lisp_drakma, lisp_cxml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_cxml  ];
      inherit stdenv;
      systemName = "cl-mediawiki";
      
      sourceProject = "${lisp-project_cl-mediawiki}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_cxml}";
      name = "lisp_cl-mediawiki-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
