
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-textmagic, 
   lisp_cl-json, lisp_dexador,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_dexador  ];
      inherit stdenv;
      systemName = "cl-textmagic";
      
      sourceProject = "${lisp-project_cl-textmagic}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_dexador}";
      name = "lisp_cl-textmagic-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
