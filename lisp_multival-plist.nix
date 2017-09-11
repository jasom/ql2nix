
{ buildLispPackage, stdenv, fetchurl, lisp-project_multival-plist, 
   lisp_alexandria, lisp_cl-annot, lisp_cl-syntax-annot, lisp_trivial-types,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-annot lisp_cl-syntax-annot lisp_trivial-types  ];
      inherit stdenv;
      systemName = "multival-plist";
      
      sourceProject = "${lisp-project_multival-plist}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-annot} ${lisp_cl-syntax-annot} ${lisp_trivial-types}";
      name = "lisp_multival-plist-20120305-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
