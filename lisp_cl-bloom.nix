
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bloom, 
   lisp_cl-murmurhash, lisp_static-vectors,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-murmurhash lisp_static-vectors  ];
      inherit stdenv;
      systemName = "cl-bloom";
      
      sourceProject = "${lisp-project_cl-bloom}";
      patches = [];
      lisp_dependencies = "${lisp_cl-murmurhash} ${lisp_static-vectors}";
      name = "lisp_cl-bloom-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
