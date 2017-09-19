
{ buildLispPackage, stdenv, fetchurl, lisp-project_multival-plist, 
   lisp_cl-syntax-annot, lisp_cl-annot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax-annot lisp_cl-annot  ];
      inherit stdenv;
      systemName = "multival-plist";
      
      sourceProject = "${lisp-project_multival-plist}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax-annot} ${lisp_cl-annot}";
      name = "lisp_multival-plist-20120305-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
