
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bson, 
   lisp_trivial-shell, lisp_rutils, lisp_local-time, lisp_let-over-lambda, lisp_ieee-floats, lisp_cl-intbytes, lisp_babel, lisp_arrow-macros,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-shell lisp_rutils lisp_local-time lisp_let-over-lambda lisp_ieee-floats lisp_cl-intbytes lisp_babel lisp_arrow-macros  ];
      inherit stdenv;
      systemName = "cl-bson";
      
      sourceProject = "${lisp-project_cl-bson}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-shell} ${lisp_rutils} ${lisp_local-time} ${lisp_let-over-lambda} ${lisp_ieee-floats} ${lisp_cl-intbytes} ${lisp_babel} ${lisp_arrow-macros}";
      name = "lisp_cl-bson-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
