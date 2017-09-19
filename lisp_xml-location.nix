
{ buildLispPackage, stdenv, fetchurl, lisp-project_xml-location, 
   lisp_cxml-stp, lisp_more-conditions, lisp_let-plus, lisp_iterate, lisp_split-sequence, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml-stp lisp_more-conditions lisp_let-plus lisp_iterate lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "xml.location";
      
      sourceProject = "${lisp-project_xml-location}";
      patches = [];
      lisp_dependencies = "${lisp_cxml-stp} ${lisp_more-conditions} ${lisp_let-plus} ${lisp_iterate} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_xml-location-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
