
{ buildLispPackage, stdenv, fetchurl, lisp-project_pack, 
   lisp_ieee-floats, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ieee-floats lisp_alexandria  ];
      inherit stdenv;
      systemName = "pack";
      
      sourceProject = "${lisp-project_pack}";
      patches = [];
      lisp_dependencies = "${lisp_ieee-floats} ${lisp_alexandria}";
      name = "lisp_pack-20110619-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
