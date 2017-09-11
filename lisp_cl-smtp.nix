
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-smtp, 
   lisp_cl-ssl, lisp_cl-base64, lisp_flexi-streams, lisp_trivial-gray-streams, lisp_usocket,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_cl-base64 lisp_flexi-streams lisp_trivial-gray-streams lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-smtp";
      
      sourceProject = "${lisp-project_cl-smtp}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_cl-base64} ${lisp_flexi-streams} ${lisp_trivial-gray-streams} ${lisp_usocket}";
      name = "lisp_cl-smtp-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
