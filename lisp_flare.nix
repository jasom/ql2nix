
{ buildLispPackage, stdenv, fetchurl, lisp-project_flare, 
   lisp_for, lisp_3d-vectors, lisp_trivial-garbage, lisp_array-utils, lisp_lambda-fiddle,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_for lisp_3d-vectors lisp_trivial-garbage lisp_array-utils lisp_lambda-fiddle  ];
      inherit stdenv;
      systemName = "flare";
      
      sourceProject = "${lisp-project_flare}";
      patches = [];
      lisp_dependencies = "${lisp_for} ${lisp_3d-vectors} ${lisp_trivial-garbage} ${lisp_array-utils} ${lisp_lambda-fiddle}";
      name = "lisp_flare-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
