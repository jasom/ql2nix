
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-openid, 
   lisp_bordeaux-threads, lisp_cl-base64, lisp_cl-html-parse, lisp_drakma, lisp_ironclad, lisp_puri, lisp_secure-random, lisp_split-sequence, lisp_trivial-utf-8, lisp_xmls,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cl-base64 lisp_cl-html-parse lisp_drakma lisp_ironclad lisp_puri lisp_secure-random lisp_split-sequence lisp_trivial-utf-8 lisp_xmls  ];
      inherit stdenv;
      systemName = "cl-openid";
      
      sourceProject = "${lisp-project_cl-openid}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cl-base64} ${lisp_cl-html-parse} ${lisp_drakma} ${lisp_ironclad} ${lisp_puri} ${lisp_secure-random} ${lisp_split-sequence} ${lisp_trivial-utf-8} ${lisp_xmls}";
      name = "lisp_cl-openid-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
