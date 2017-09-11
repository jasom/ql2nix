
{ buildLispPackage, stdenv, fetchurl, lisp-project_mel-base, 
   lisp_flexi-streams, lisp_cl-ssl, lisp_usocket,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_cl-ssl lisp_usocket  ];
      inherit stdenv;
      systemName = "mel-base";
      
      sourceProject = "${lisp-project_mel-base}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_cl-ssl} ${lisp_usocket}";
      name = "lisp_mel-base-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
