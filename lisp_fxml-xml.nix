
{ buildLispPackage, stdenv, fetchurl, lisp-project_fxml, 
   lisp_fxml-runes, lisp_quri, lisp_flexi-streams, lisp_serapeum,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fxml-runes lisp_quri lisp_flexi-streams lisp_serapeum  ];
      inherit stdenv;
      systemName = "fxml/xml";
      
      sourceProject = "${lisp-project_fxml}";
      patches = [];
      lisp_dependencies = "${lisp_fxml-runes} ${lisp_quri} ${lisp_flexi-streams} ${lisp_serapeum}";
      name = "lisp_fxml-xml-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
