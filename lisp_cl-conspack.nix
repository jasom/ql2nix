
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-conspack, 
   lisp_trivial-garbage, lisp_fast-io, lisp_trivial-utf-8, lisp_ieee-floats, lisp_alexandria, lisp_closer-mop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_fast-io lisp_trivial-utf-8 lisp_ieee-floats lisp_alexandria lisp_closer-mop  ];
      inherit stdenv;
      systemName = "cl-conspack";
      
      sourceProject = "${lisp-project_cl-conspack}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_fast-io} ${lisp_trivial-utf-8} ${lisp_ieee-floats} ${lisp_alexandria} ${lisp_closer-mop}";
      name = "lisp_cl-conspack-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
