
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-oauth, 
   lisp_alexandria, lisp_anaphora, lisp_babel, lisp_cl-base64, lisp_closer-mop, lisp_drakma, lisp_f-underscore, lisp_hunchentoot, lisp_ironclad, lisp_puri, lisp_split-sequence, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_babel lisp_cl-base64 lisp_closer-mop lisp_drakma lisp_f-underscore lisp_hunchentoot lisp_ironclad lisp_puri lisp_split-sequence lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "cl-oauth";
      
      sourceProject = "${lisp-project_cl-oauth}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_babel} ${lisp_cl-base64} ${lisp_closer-mop} ${lisp_drakma} ${lisp_f-underscore} ${lisp_hunchentoot} ${lisp_ironclad} ${lisp_puri} ${lisp_split-sequence} ${lisp_trivial-garbage}";
      name = "lisp_cl-oauth-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
