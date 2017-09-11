
{ buildLispPackage, stdenv, fetchurl, lisp-project_flare, 
   lisp_lambda-fiddle, lisp_array-utils, lisp_trivial-garbage, lisp_3d-vectors, lisp_for,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lambda-fiddle lisp_array-utils lisp_trivial-garbage lisp_3d-vectors lisp_for  ];
      inherit stdenv;
      systemName = "flare";
      
      sourceProject = "${lisp-project_flare}";
      patches = [];
      lisp_dependencies = "${lisp_lambda-fiddle} ${lisp_array-utils} ${lisp_trivial-garbage} ${lisp_3d-vectors} ${lisp_for}";
      name = "lisp_flare-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
