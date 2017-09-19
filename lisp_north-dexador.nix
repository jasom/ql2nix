
{ buildLispPackage, stdenv, fetchurl, lisp-project_north, 
   lisp_documentation-utils, lisp_crypto-shortcuts, lisp_uuid, lisp_dexador,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_crypto-shortcuts lisp_uuid lisp_dexador  ];
      inherit stdenv;
      systemName = "north-dexador";
      
      sourceProject = "${lisp-project_north}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_crypto-shortcuts} ${lisp_uuid} ${lisp_dexador}";
      name = "lisp_north-dexador-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
