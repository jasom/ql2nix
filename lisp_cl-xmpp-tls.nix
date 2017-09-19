
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-xmpp, 
   lisp_cl-ssl, lisp_cl-sasl, lisp_cl-base64, lisp_ironclad, lisp_cxml, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_cl-sasl lisp_cl-base64 lisp_ironclad lisp_cxml lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-xmpp-tls";
      
      sourceProject = "${lisp-project_cl-xmpp}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_cl-sasl} ${lisp_cl-base64} ${lisp_ironclad} ${lisp_cxml} ${lisp_usocket}";
      name = "lisp_cl-xmpp-tls-0.8.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
