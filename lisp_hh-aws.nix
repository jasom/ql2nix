
{ buildLispPackage, stdenv, fetchurl, lisp-project_hh-aws, 
   lisp_cl-base64, lisp_drakma, lisp_ironclad, lisp_puri, lisp_s-xml,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_drakma lisp_ironclad lisp_puri lisp_s-xml  ];
      inherit stdenv;
      systemName = "hh-aws";
      
      sourceProject = "${lisp-project_hh-aws}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_drakma} ${lisp_ironclad} ${lisp_puri} ${lisp_s-xml}";
      name = "lisp_hh-aws-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
