
{ buildLispPackage, stdenv, fetchurl, lisp-project_jenkins, 
   lisp_cl-json, lisp_xml-location, lisp_drakma, lisp_puri, lisp_cl-ppcre, lisp_more-conditions, lisp_let-plus, lisp_iterate, lisp_closer-mop, lisp_split-sequence, lisp_alexandria,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_xml-location lisp_drakma lisp_puri lisp_cl-ppcre lisp_more-conditions lisp_let-plus lisp_iterate lisp_closer-mop lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "jenkins.api";
      
      sourceProject = "${lisp-project_jenkins}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_xml-location} ${lisp_drakma} ${lisp_puri} ${lisp_cl-ppcre} ${lisp_more-conditions} ${lisp_let-plus} ${lisp_iterate} ${lisp_closer-mop} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_jenkins-api-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
