
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-junit-xml, 
   lisp_lisp-unit2, lisp_iterate, lisp_cxml,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-unit2 lisp_iterate lisp_cxml  ];
      inherit stdenv;
      systemName = "cl-junit-xml.lisp-unit2";
      
      sourceProject = "${lisp-project_cl-junit-xml}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-unit2} ${lisp_iterate} ${lisp_cxml}";
      name = "lisp_cl-junit-xml-lisp-unit2-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
