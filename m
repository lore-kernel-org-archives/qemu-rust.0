Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91158CD5BC8
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 18:00:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1T-00026s-Gg; Tue, 26 May 2026 13:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1S-00026T-MV
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1Q-0007zn-Ft
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gANO1dHY/McFEVD+OLbOHVJl89l7bOu5SWe3UKWw+s=;
 b=e8JNOSc3xLizmHbBb/kleWYeIskD/UoNEFIjEFXWzSfsiIGIErT7IRxHbkUyxDd1BoEEYP
 bBpNnuTqOdoZ9tVYeesBO3bUD4H/KJMx++nnV1WJZ7LAv3e3ZqETvNQdQTPomVR1tfwzEd
 pDTxX/SlZpIT9YZ++6cxEQ4YU2k4UI8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-xqHZww7PPumH63Bv1LGjRQ-1; Tue, 26 May 2026 13:56:53 -0400
X-MC-Unique: xqHZww7PPumH63Bv1LGjRQ-1
X-Mimecast-MFC-AGG-ID: xqHZww7PPumH63Bv1LGjRQ_1779818212
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-45aeac88af4so8810955f8f.3
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818212; x=1780423012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8gANO1dHY/McFEVD+OLbOHVJl89l7bOu5SWe3UKWw+s=;
 b=Y2JZRlpW+NsZX8kyCPLrx5XdOljB0R+KDgPQSoPOt9ncB2NLbJmiuqmNdZsmFIUCWf
 LT4m85Q3TyzFgnAd2M8l+bZmSGbDpCRgpOhFRl3bTlPKFjYXTGLZ9x8e3cZ/28705Vtq
 6gvj54PDvDBY5CnKtlTKGtq9d03ydGiJZ+nxqQ5TJVgDw2esRlToDNAKgzFo352widOY
 HMFZLyCdjTg7OxmPEzYoNCQcAE0GPghi/JCLStBcDrmwVrgc1CQg6x313Ly6FBpN3mRX
 pVbZIOBOgEd1Ct6CuOgFnBtB0r5YoP4XHjpQiv4I4HkqVt4QbcsHUMQiY4i9I5ikZxAw
 Iw/A==
X-Gm-Message-State: AOJu0Yw6w53nPkLJYUIA96T6AxieCX7IfM0Qr+0XLFQCAjL722H88CwI
 HImKd2CdjvtJOWWgvKxVmBQf9fhrfM/vhiP2+jhwRkSvanP+iSUdarzQeNH/Ag+qOx6KQNJeZXt
 CP7bejETRXp9ED45Rc1svhEeqs7xM77raGZvdSLh2eii/Kf7pgA8bXxQ=
X-Gm-Gg: Acq92OGrTmGestEN04kz8jplWXyJ23aEGwMy5savkntXzLBlrSa/6Kf9pTg29EY5S44
 2rLcJebjkntjRKToacTpha0DyR9rIZ1RlnCnlEpPniNrzfrNz2y65MhUVnY3UZb+qvSQN2r+ibU
 xJi0GtaYOtCXOFNQwHoojFZkP1hApwqGNmxbsSJ1lW3Rlcd42EnPKSG5b3o9FTmesOfeQVLPCwl
 /Erz4njrwO8SqCXlRU/bMvmU3jJqhjkPESkd0al6+PfzmKB2ZATsLhMqEOB6xdKj1zuhr0PDYS6
 NIL7USaDNFSjNakcLZwfK5ksC1cYCSfJTYE1UBGL1TykiNnayQawrb0xxYPsN+jORFNmMSFYd3n
 XFQuwuLdUpNHo26fBxKX1BNSkbkK5u5rt+4FqlHD/r8gEIa5faOn+P25xZtUSUOlee0gAw+uzMv
 pQ8SkGiYQd/DB9iQLETFpvqzhw25bOl835GuAf7w==
X-Received: by 2002:a05:600d:6451:10b0:48a:563c:c8c0 with SMTP id
 5b1f17b1804b1-4904249d11amr239850595e9.7.1779818211977; 
 Tue, 26 May 2026 10:56:51 -0700 (PDT)
X-Received: by 2002:a05:600d:6451:10b0:48a:563c:c8c0 with SMTP id
 5b1f17b1804b1-4904249d11amr239850315e9.7.1779818211595; 
 Tue, 26 May 2026 10:56:51 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b9asm336803755e9.11.2026.05.26.10.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH v3 11/19] scripts/qapi: add QAPISchemaIfCond.rsgen()
Date: Tue, 26 May 2026 19:56:10 +0200
Message-ID: <20260526175618.227743-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YDDLoNVzr9y7tygYllXHFB0TenymQZkGnE7RZpkzPI4_1779818212
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Generate Rust #[cfg(...)] guards from QAPI 'if' conditions; it
turns out that they are very similar, with both of them using
not/any/all, so just walk the tree.

The next commit will put it to use.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Link: https://lore.kernel.org/r/20210907121943.3498701-15-marcandre.lureau@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/common.py        | 19 +++++++++++++++++++
 scripts/qapi/schema.py        |  4 ++++
 tests/qapi-schema/meson.build |  1 +
 3 files changed, 24 insertions(+)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index d7c8aa3365c..14d5dd259c4 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -199,6 +199,25 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
+def rsgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
+
+    def cfg(ifcond: Union[str, Dict[str, Any]]) -> str:
+        if isinstance(ifcond, str):
+            return ifcond
+        assert isinstance(ifcond, dict) and len(ifcond) == 1
+        if 'not' in ifcond:
+            oper = 'not'
+            arg = cfg(ifcond['not'])
+        else:
+            oper, operands = next(iter(ifcond.items()))
+            arg = ', '.join([cfg(c) for c in operands])
+        return f'{oper}({arg})'
+
+    if not ifcond:
+        return ''
+    return '#[cfg(%s)]' % cfg(ifcond)
+
+
 def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
                cond_fmt: str, not_fmt: str,
                all_operator: str, any_operator: str) -> str:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index a5a11298817..7bb9fb712cf 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -37,6 +37,7 @@
     docgen_ifcond,
     gen_endif,
     gen_if,
+    rsgen_ifcond,
 )
 from .error import QAPIError, QAPISemError, QAPISourceError
 from .expr import check_exprs
@@ -63,6 +64,9 @@ def gen_endif(self) -> str:
     def docgen(self) -> str:
         return docgen_ifcond(self.ifcond)
 
+    def rsgen(self) -> str:
+        return rsgen_ifcond(self.ifcond)
+
     def is_present(self) -> bool:
         return bool(self.ifcond)
 
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 3b0c16a8b67..40429a22774 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -97,6 +97,7 @@ schemas = [
   'enum-bad-prefix.json',
   'enum-clash-member.json',
   'enum-dict-member-unknown.json',
+  'enum-empty.json',
   'enum-if-first-required.json',
   'enum-if-invalid.json',
   'enum-int-member.json',
-- 
2.54.0


