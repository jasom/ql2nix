
{ buildLispPackage, stdenv, fetchurl, lisp-project_fxml, 
   lisp_cxml, lisp_serapeum, lisp_flexi-streams, lisp_quri, lisp_trivial-gray-streams, lisp_named-readtables, lisp_babel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml lisp_serapeum lisp_flexi-streams lisp_quri lisp_trivial-gray-streams lisp_named-readtables lisp_babel  ];
      inherit stdenv;
      systemName = "fxml/cxml";
      
      sourceProject = "${lisp-project_fxml}";
      patches = [];
      lisp_dependencies = "${lisp_cxml} ${lisp_serapeum} ${lisp_flexi-streams} ${lisp_quri} ${lisp_trivial-gray-streams} ${lisp_named-readtables} ${lisp_babel}";
      name = "lisp_fxml-cxml-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }