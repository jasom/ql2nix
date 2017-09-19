
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bloom, 
   lisp_static-vectors, lisp_cl-murmurhash,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_static-vectors lisp_cl-murmurhash  ];
      inherit stdenv;
      systemName = "cl-bloom";
      
      sourceProject = "${lisp-project_cl-bloom}";
      patches = [];
      lisp_dependencies = "${lisp_static-vectors} ${lisp_cl-murmurhash}";
      name = "lisp_cl-bloom-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
