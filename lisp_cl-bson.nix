
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bson, 
   lisp_arrow-macros, lisp_babel, lisp_cl-intbytes, lisp_fast-io, lisp_ieee-floats, lisp_let-over-lambda, lisp_local-time, lisp_named-readtables, lisp_rutils, lisp_trivial-shell,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arrow-macros lisp_babel lisp_cl-intbytes lisp_fast-io lisp_ieee-floats lisp_let-over-lambda lisp_local-time lisp_named-readtables lisp_rutils lisp_trivial-shell  ];
      inherit stdenv;
      systemName = "cl-bson";
      
      sourceProject = "${lisp-project_cl-bson}";
      patches = [];
      lisp_dependencies = "${lisp_arrow-macros} ${lisp_babel} ${lisp_cl-intbytes} ${lisp_fast-io} ${lisp_ieee-floats} ${lisp_let-over-lambda} ${lisp_local-time} ${lisp_named-readtables} ${lisp_rutils} ${lisp_trivial-shell}";
      name = "lisp_cl-bson-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
