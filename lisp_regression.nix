
{ buildLispPackage, stdenv, fetchurl, lisp-project_gendl, 
   lisp_yason, lisp_acl-compat, lisp_babel, lisp_cl-base64, lisp_cl-who, lisp_cl-ppcre, lisp_cl-typesetting, lisp_bordeaux-threads, lisp_lift,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_yason lisp_acl-compat lisp_babel lisp_cl-base64 lisp_cl-who lisp_cl-ppcre lisp_cl-typesetting lisp_bordeaux-threads lisp_lift  ];
      inherit stdenv;
      systemName = "regression";
      
      sourceProject = "${lisp-project_gendl}";
      patches = [];
      lisp_dependencies = "${lisp_yason} ${lisp_acl-compat} ${lisp_babel} ${lisp_cl-base64} ${lisp_cl-who} ${lisp_cl-ppcre} ${lisp_cl-typesetting} ${lisp_bordeaux-threads} ${lisp_lift}";
      name = "lisp_regression-devo-0272a167-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
