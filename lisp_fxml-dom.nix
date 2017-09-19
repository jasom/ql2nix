
{ buildLispPackage, stdenv, fetchurl, lisp-project_fxml, 
   lisp_serapeum, lisp_flexi-streams, lisp_quri, lisp_trivial-gray-streams, lisp_named-readtables, lisp_babel,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_serapeum lisp_flexi-streams lisp_quri lisp_trivial-gray-streams lisp_named-readtables lisp_babel  ];
      inherit stdenv;
      systemName = "fxml/dom";
      
      sourceProject = "${lisp-project_fxml}";
      patches = [];
      lisp_dependencies = "${lisp_serapeum} ${lisp_flexi-streams} ${lisp_quri} ${lisp_trivial-gray-streams} ${lisp_named-readtables} ${lisp_babel}";
      name = "lisp_fxml-dom-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
