
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-openid, 
   lisp_secure-random, lisp_trivial-utf-8, lisp_cl-html-parse, lisp_xmls, lisp_ironclad, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_secure-random lisp_trivial-utf-8 lisp_cl-html-parse lisp_xmls lisp_ironclad lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-openid";
      
      sourceProject = "${lisp-project_cl-openid}";
      patches = [];
      lisp_dependencies = "${lisp_secure-random} ${lisp_trivial-utf-8} ${lisp_cl-html-parse} ${lisp_xmls} ${lisp_ironclad} ${lisp_drakma}";
      name = "lisp_cl-openid-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
