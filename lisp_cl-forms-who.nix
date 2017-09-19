
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-forms, 
   lisp_cl-who, lisp_fmt, lisp_clavier, lisp_uuid, lisp_ironclad, lisp_hunchentoot, lisp_cl-ppcre, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-who lisp_fmt lisp_clavier lisp_uuid lisp_ironclad lisp_hunchentoot lisp_cl-ppcre lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-forms.who";
      
      sourceProject = "${lisp-project_cl-forms}";
      patches = [];
      lisp_dependencies = "${lisp_cl-who} ${lisp_fmt} ${lisp_clavier} ${lisp_uuid} ${lisp_ironclad} ${lisp_hunchentoot} ${lisp_cl-ppcre} ${lisp_alexandria}";
      name = "lisp_cl-forms-who-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
