
{ buildLispPackage, stdenv, fetchurl, lisp-project_zenekindarl, 
   lisp_alexandria, lisp_anaphora, lisp_babel, lisp_cl-annot, lisp_cl-ppcre, lisp_fast-io, lisp_html-encode, lisp_mpc, lisp_optima,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_babel lisp_cl-annot lisp_cl-ppcre lisp_fast-io lisp_html-encode lisp_mpc lisp_optima  ];
      inherit stdenv;
      systemName = "zenekindarl";
      
      sourceProject = "${lisp-project_zenekindarl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_babel} ${lisp_cl-annot} ${lisp_cl-ppcre} ${lisp_fast-io} ${lisp_html-encode} ${lisp_mpc} ${lisp_optima}";
      name = "lisp_zenekindarl-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
