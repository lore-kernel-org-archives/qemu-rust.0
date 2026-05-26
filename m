Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572F4CD5BB1
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:59:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1n-0002NN-KU; Tue, 26 May 2026 13:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1l-0002LG-Vq
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1k-00087F-45
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6C9lsEi5iNLqmgqFh1Mzb9/99gwNr4jDcrF6Yon6gz4=;
 b=FoBPA64OpvFN4GSLTAkJVkRvdfNpSU4UghDY06tqdJMd8OooN9yrId3Di6+Gbpq9w7kyOx
 XvdY/z8wg572qcYsfqtUHCO9QOOh4vMjgaePaBvGILkJazaiubGgdpIswBSWezlJTlYrie
 x7/hKSoxgaw68t0iNABwFrGONsClzro=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-Cya4skOXMO-5bASbSBF34A-1; Tue, 26 May 2026 13:57:13 -0400
X-MC-Unique: Cya4skOXMO-5bASbSBF34A-1
X-Mimecast-MFC-AGG-ID: Cya4skOXMO-5bASbSBF34A_1779818232
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45e81291d62so8966697f8f.1
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818232; x=1780423032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6C9lsEi5iNLqmgqFh1Mzb9/99gwNr4jDcrF6Yon6gz4=;
 b=g3eD2WNDIEXqkVqG6XYmfbbjZNRFwtxaB4Rhqw4ZIEk/dphbuFCmPb8MAimNWabP0S
 03mOebPEI9CPSTwF8NJf8x3mQgwLloctEImgfBm/lzV3pj7idQ5b9G5rpFpKOhuH6Q+F
 nL037j5RURjVnY13Gf/FxNQDlwYs8I40Cg5e83atRtl5idFTz4u8L7V33J1oT0ib1Gk9
 Qn8UodAQWPYYkNA3ltn0GdIfKs2Xum/hrsW+YW18JtY1xjLUPDVv4dEFePb9iHXma1FU
 Fq3LFHFPoC3GWzhk7Yl+29MpVLQPViX01Rq/172/iPW90Sz08cL0dEBrUOb63/gpe83C
 MGAw==
X-Gm-Message-State: AOJu0Yx0O2KBkFHqvQPbjaATFmLZkTduV4UHNToz1dU+fylcgn7l52gh
 hwBrlfUu0ztHdcP/VU40GzWa4jBbrlOgylsFdIC+++n408sMPpWz1HuDMPLz6QIznWPqhoIxw/P
 TYhV5gDObl3p/ENSXfIJW2y6LG6VibQWjm96OjhKBKBR7OjPuz5wEfN4=
X-Gm-Gg: Acq92OGsdNwP6dT3unz0W3hHHYHYycB/Jx71M4ynNuKIg66+h6J7YHQ+KO0KYEzKPPS
 TkvQ3PDB+DTrcieNI17WnIuAiVV1J+U33trJgmrMKrQuoq66TxD6DUNFCGxgynHghLjB3k6WFFK
 vF/xq89q+5k3g4cHNNbQQOtd7XIIpVxJAp9i9dhV/njgNk52QrLTsK+XE+Nac3bPFVGpqE00n2E
 30c04wf2yZmD6MORPVLm0bzalwsPzAapvh9WSux/pCvTpcW76vL4R/6u3RorDeHABAgZ4ieS7k3
 6DVnUHKmEwMJZX0OrIDwsnNtJ1oqhuBadJ/1jBH6XEwt+qw/XTd2H+viDY17ZtiW/FKPxcYmz4H
 AgiPAMsJ5eP/Qo2Ep1lqZsmq540OMik7MskZ+3DHHAGY9gP0BynBansx8EWBqgn58w9aVmSGe35
 S5STt14KOAORBdOVeDlc7jS+25db0=
X-Received: by 2002:a05:6000:2888:b0:43d:d037:d59c with SMTP id
 ffacd0b85a97d-45eb3697a48mr34282343f8f.16.1779818232477; 
 Tue, 26 May 2026 10:57:12 -0700 (PDT)
X-Received: by 2002:a05:6000:2888:b0:43d:d037:d59c with SMTP id
 ffacd0b85a97d-45eb3697a48mr34282303f8f.16.1779818232079; 
 Tue, 26 May 2026 10:57:12 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6c9de2dsm35999338f8f.4.2026.05.26.10.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:57:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH v3 18/19] scripts/qapi: add serde attributes
Date: Tue, 26 May 2026 19:56:17 +0200
Message-ID: <20260526175618.227743-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lmK05GefM7o0LOCxPAN5Fx_5WePERjALE0cKfut-b_I_1779818232
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Generate serde attributes to match the serialization format to QAPI's:

- for enums, map Rust enum variants to original QAPI names

- for structs, rejects JSON with extra fields and omit optional fields
  (as opposed to serializing them as null)

- for union variants:
  - use tagged union format matching QAPI's discriminator,
  - map variant names to original QAPI names
  - flatten union data into parent struct

- for alternates, use type-based discrimination

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/rs_types.py | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/scripts/qapi/rs_types.py b/scripts/qapi/rs_types.py
index 874ebdbfa41..41ed83c381d 100644
--- a/scripts/qapi/rs_types.py
+++ b/scripts/qapi/rs_types.py
@@ -34,6 +34,7 @@
 
 
 objects_seen = set()
+SERDE_SKIP_NONE = '#[serde(skip_serializing_if = "Option::is_none")]'
 
 
 def gen_rs_variants_to_tag(name: str,
@@ -80,10 +81,12 @@ def gen_rs_variants(name: str,
     ret = mcgen('''
 
 %(cfg)s''', '''
-#[derive(Clone, Debug, PartialEq)]
+#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
+#[serde(tag = "%(tag)s")]
 pub enum %(rs_name)sVariant {''',
                 cfg=ifcond.rsgen(),
-                rs_name=rs_name(name))
+                rs_name=rs_name(name),
+                tag=variants.tag_member.name)
 
     for var in variants.variants:
         type_name = var.type.name
@@ -91,18 +94,22 @@ def gen_rs_variants(name: str,
         if type_name == 'q_empty':
             ret += mcgen('''
     %(cfg)s''', '''
+    #[serde(rename = "%(rename)s")]
     %(var_name)s,
 ''',
                          cfg=var.ifcond.rsgen(),
-                         var_name=var_name)
+                         var_name=var_name,
+                         rename=var.name)
         else:
             ret += mcgen('''
     %(cfg)s''', '''
+    #[serde(rename = "%(rename)s")]
     %(var_name)s(%(rs_type)s),
 ''',
                          cfg=var.ifcond.rsgen(),
                          var_name=var_name,
-                         rs_type=var.type.rs_type())
+                         rs_type=var.type.rs_type(),
+                         rename=var.name)
 
     ret += mcgen('''
 }
@@ -158,9 +165,11 @@ def gen_struct_members(members: List[QAPISchemaObjectTypeMember],
             typ = 'Option<%s>' % typ
         ret.append(mcgen('''
 %(cfg)s''', '''
+%(skip_if)s''', '''
     pub %(rs_name)s: %(rs_type)s,
 ''',
                          cfg=memb.ifcond.rsgen(),
+                         skip_if=SERDE_SKIP_NONE if memb.optional else '',
                          rs_type=typ,
                          rs_name=rs_name(camel_to_lower(memb.name))))
     return '\n'.join(ret)
@@ -181,17 +190,23 @@ def gen_rs_object(name: str,
     ret = ''
     objects_seen.add(name)
 
+    serde_deny_unknown_fields = "#[serde(deny_unknown_fields)]"
     if variants:
         ret += gen_rs_variants(name, ifcond, variants)
+        # we can't use because of the flatten unions
+        # serde FlatMapAccess should consume the fields?
+        serde_deny_unknown_fields = ""
 
     ret += mcgen('''
 
 %(cfg)s''', '''
-#[derive(Clone, Debug, PartialEq)]''', '''
+#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]''', '''
+%(serde_deny_unknown_fields)s''', '''
 pub struct %(rs_name)s {
 ''',
                  cfg=ifcond.rsgen(),
-                 rs_name=rs_name(name))
+                 rs_name=rs_name(name),
+                 serde_deny_unknown_fields=serde_deny_unknown_fields)
 
     if base:
         if not base.is_implicit():
@@ -213,6 +228,7 @@ def gen_rs_object(name: str,
 
     if variants:
         ret += mcgen('''
+    #[serde(flatten)]
     pub u: %(rs_type)sVariant,
 ''', rs_type=rs_name(name))
     ret += mcgen('''
@@ -227,7 +243,7 @@ def gen_rs_enum(name: str,
     ret = mcgen('''
 
 %(cfg)s''', '''
-#[derive(Copy, Clone, Debug, PartialEq)]
+#[derive(Copy, Clone, Debug, PartialEq, Serialize, Deserialize)]
 ''',
                 cfg=ifcond.rsgen())
 
@@ -242,10 +258,12 @@ def gen_rs_enum(name: str,
     for member in members:
         ret += mcgen('''
     %(cfg)s''', '''
+    #[serde(rename = "%(member_name)s")]
     %(c_enum)s,
 ''',
                      cfg=member.ifcond.rsgen(),
-                     c_enum=rs_name(camel_to_upper(member.name)))
+                     c_enum=rs_name(camel_to_upper(member.name)),
+                     member_name=member.name)
     ret += '''}
 
 '''
@@ -279,7 +297,8 @@ def gen_rs_alternate(name: str,
 
     ret += mcgen('''
 %(cfg)s''', '''
-#[derive(Clone, Debug, PartialEq)]
+#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
+#[serde(untagged)]
 pub enum %(rs_name)s {
 ''',
                  cfg=ifcond.rsgen(),
@@ -329,6 +348,8 @@ def visit_begin(self, schema: QAPISchema) -> None:
 // that *could* be Eq too.
 #![allow(clippy::derive_partial_eq_without_eq)]
 
+use serde_derive::{Serialize, Deserialize};
+
 use util::qobject::QObject;
 '''))
 
-- 
2.54.0


