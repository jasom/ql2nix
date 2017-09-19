
{ buildLispPackage, stdenv, fetchurl, lisp-project_3d-vectors, 
   lisp_documentation-utils,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "3d-vectors";
      
      sourceProject = "${lisp-project_3d-vectors}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils}";
      name = "lisp_3d-vectors-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
