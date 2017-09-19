
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-typesetting, 
   lisp_xmls, lisp_cl-pdf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_xmls lisp_cl-pdf  ];
      inherit stdenv;
      systemName = "xml-render";
      
      sourceProject = "${lisp-project_cl-typesetting}";
      patches = [];
      lisp_dependencies = "${lisp_xmls} ${lisp_cl-pdf}";
      name = "lisp_xml-render-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
