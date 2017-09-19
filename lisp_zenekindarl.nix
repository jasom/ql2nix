
{ buildLispPackage, stdenv, fetchurl, lisp-project_zenekindarl, 
   lisp_cl-annot, lisp_mpc, lisp_fast-io, lisp_html-encode, lisp_cl-ppcre, lisp_optima, lisp_babel, lisp_anaphora, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-annot lisp_mpc lisp_fast-io lisp_html-encode lisp_cl-ppcre lisp_optima lisp_babel lisp_anaphora lisp_alexandria  ];
      inherit stdenv;
      systemName = "zenekindarl";
      
      sourceProject = "${lisp-project_zenekindarl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-annot} ${lisp_mpc} ${lisp_fast-io} ${lisp_html-encode} ${lisp_cl-ppcre} ${lisp_optima} ${lisp_babel} ${lisp_anaphora} ${lisp_alexandria}";
      name = "lisp_zenekindarl-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
