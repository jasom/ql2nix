
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-oauth, 
   lisp_hunchentoot, lisp_drakma, lisp_trivial-garbage, lisp_split-sequence, lisp_f-underscore, lisp_anaphora, lisp_closer-mop, lisp_babel, lisp_cl-base64, lisp_ironclad,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot lisp_drakma lisp_trivial-garbage lisp_split-sequence lisp_f-underscore lisp_anaphora lisp_closer-mop lisp_babel lisp_cl-base64 lisp_ironclad  ];
      inherit stdenv;
      systemName = "cl-oauth";
      
      sourceProject = "${lisp-project_cl-oauth}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot} ${lisp_drakma} ${lisp_trivial-garbage} ${lisp_split-sequence} ${lisp_f-underscore} ${lisp_anaphora} ${lisp_closer-mop} ${lisp_babel} ${lisp_cl-base64} ${lisp_ironclad}";
      name = "lisp_cl-oauth-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
