
{ buildLispPackage, stdenv, fetchurl, lisp-project_gendl, 
   lisp_cl-html-parse, lisp_yason, lisp_acl-compat, lisp_babel, lisp_cl-base64, lisp_cl-ppcre, lisp_cl-typesetting, lisp_bordeaux-threads, lisp_cl-who,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-html-parse lisp_yason lisp_acl-compat lisp_babel lisp_cl-base64 lisp_cl-ppcre lisp_cl-typesetting lisp_bordeaux-threads lisp_cl-who  ];
      inherit stdenv;
      systemName = "dom";
      
      sourceProject = "${lisp-project_gendl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-html-parse} ${lisp_yason} ${lisp_acl-compat} ${lisp_babel} ${lisp_cl-base64} ${lisp_cl-ppcre} ${lisp_cl-typesetting} ${lisp_bordeaux-threads} ${lisp_cl-who}";
      name = "lisp_dom-devo-0272a167-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
