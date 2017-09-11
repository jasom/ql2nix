
{ buildLispPackage, stdenv, fetchurl, lisp-project_3d-matrices, 
   lisp_documentation-utils, lisp_3d-vectors,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_3d-vectors  ];
      inherit stdenv;
      systemName = "3d-matrices";
      
      sourceProject = "${lisp-project_3d-matrices}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_3d-vectors}";
      name = "lisp_3d-matrices-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
