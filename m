Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AE3FF885A
	for <qemu-rust@archiver.kernel.org>; Tue,  5 May 2026 08:44:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wKBOM-0005EW-2F; Tue, 05 May 2026 04:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1wKBOJ-0005Dm-1m
 for qemu-rust@nongnu.org; Tue, 05 May 2026 04:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1wKBOH-0004EK-It
 for qemu-rust@nongnu.org; Tue, 05 May 2026 04:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777970668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=wMEfkeHNsX1m7cd1AfdWOazE57PbuGCY/o6IOEnGpuY=;
 b=F8hCinpbKtpqcL+ri1QRy8dq0C1JGbCOcw4/tun7JbiXLY5w0I2NC6Jkc3ag/2RWbd85MC
 /tS+ms234RWDQ6wcC6jczQrlJKioKiFwjZeYrHlhZl2RF+8JZx9icQMxCr384Ff4OQyfAD
 im1S2jg4YPDIz9igv061a7moKsqKYzY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-251-vFCfClLqMO2IRvqJSs9xcA-1; Tue,
 05 May 2026 04:44:25 -0400
X-MC-Unique: vFCfClLqMO2IRvqJSs9xcA-1
X-Mimecast-MFC-AGG-ID: vFCfClLqMO2IRvqJSs9xcA_1777970664
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 71649195605A; Tue,  5 May 2026 08:44:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2EE43196B09E; Tue,  5 May 2026 08:44:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9828521E6A01; Tue, 05 May 2026 10:44:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Can we make QMP commands in Rust always be coroutine safe?
Date: Tue, 05 May 2026 10:44:21 +0200
Message-ID: <87tssm5jq2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: Pjgu90C2spE2Yg9pyfEHpsZ2rMP-QD_OXek0KmL9PSg_1777970664
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

QMP commands that perform potentially blocking I/O can profit from
running in a coroutine.  Ideally, we'd run all commands in coroutine
context: most of them don't care, a few profit.  However, some existing
commands may need fixing to run safely there.  Since we don't know which
ones do, running in couroutine context is opt-in.  From
docs/devel/qapi-code-gen.rst section "Commands":

    Member 'coroutine' tells the QMP dispatcher whether the command handler
    is safe to be run in a coroutine.  It defaults to false.  If it is true,
    the command handler is called from coroutine context and may yield while
    waiting for an external event (such as I/O completion) in order to avoid
    blocking the guest and other background operations.

    Coroutine safety can be hard to prove, similar to thread safety.  Common
    pitfalls are:

    - The BQL isn't held across ``qemu_coroutine_yield()``, so
      operations that used to assume that they execute atomically may have
      to be more careful to protect against changes in the global state.

    - Nested event loops (``AIO_WAIT_WHILE()`` etc.) are problematic in
      coroutine context and can easily lead to deadlocks.  They should be
      replaced by yielding and reentering the coroutine when the condition
      becomes false.

    Since the command handler may assume coroutine context, any callers
    other than the QMP dispatcher must also call it in coroutine context.
    In particular, HMP commands calling such a QMP command handler must be
    marked ``.coroutine = true`` in hmp-commands.hx.

    It is an error to specify both ``'coroutine': true`` and ``'allow-oob': true``
    for a command.  We don't currently have a use case for both together and
    without a use case, it's not entirely clear what the semantics should
    be.

Can we make commands written in Rust always coroutine safe?


