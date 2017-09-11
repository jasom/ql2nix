
{ buildLispPackage, stdenv, fetchurl, lisp-project_xml-mop, 
   lisp_closer-mop, lisp_s-xml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_s-xml  ];
      inherit stdenv;
      systemName = "xml-mop";
      
      sourceProject = "${lisp-project_xml-mop}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_s-xml}";
      name = "lisp_xml-mop-20110418-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
