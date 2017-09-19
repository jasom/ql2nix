
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-lastfm, 
   lisp_trivial-utf-8, lisp_url-rewrite, lisp_cxml-stp, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8 lisp_url-rewrite lisp_cxml-stp lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-lastfm";
      
      sourceProject = "${lisp-project_cl-lastfm}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8} ${lisp_url-rewrite} ${lisp_cxml-stp} ${lisp_drakma}";
      name = "lisp_cl-lastfm-0.2.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
