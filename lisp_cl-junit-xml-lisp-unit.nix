
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-junit-xml, 
   lisp_cl-ppcre, lisp_lisp-unit, lisp_iterate, lisp_cxml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_lisp-unit lisp_iterate lisp_cxml  ];
      inherit stdenv;
      systemName = "cl-junit-xml.lisp-unit";
      
      sourceProject = "${lisp-project_cl-junit-xml}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_lisp-unit} ${lisp_iterate} ${lisp_cxml}";
      name = "lisp_cl-junit-xml-lisp-unit-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
