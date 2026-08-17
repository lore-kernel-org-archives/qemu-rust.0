Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C126C5B572
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Aug 2026 19:46:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ww3HM-0003fy-UU; Mon, 17 Aug 2026 15:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ww3HI-0003fS-A5
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 15:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ww3HG-0005KB-2v
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 15:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786995945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDbEfFFdHOi5PvB6UkUVWFVsUi/7fUizp0mMUfdJvJY=;
 b=TwKgDhuV+3paE6GbXqsNcMT571e8tr+c2NALjNOKIBu+vn30ZlExhj/tyAEAghQZ0zaT2B
 uJ0jlItHBz0jPOZsXO5s4wvB4cNXhgd+NgChlIq+ed1ldgiX+TnojhxSiTQwjL65nZ/Ypi
 IY3eZAlaub0dyUohynuvdQVth5QMmZY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-HbLXA5CXMeGsPhRQV-pVgg-1; Mon,
 17 Aug 2026 15:45:30 -0400
X-MC-Unique: HbLXA5CXMeGsPhRQV-pVgg-1
X-Mimecast-MFC-AGG-ID: HbLXA5CXMeGsPhRQV-pVgg_1786995929
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E31C919560A7; Mon, 17 Aug 2026 19:45:28 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0A8823000239; Mon, 17 Aug 2026 19:45:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/9] First batch of Rust changes for QEMU 11.2
From: marcandre.lureau@redhat.com
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
In-Reply-To: <20260817134538.924615-1-pbonzini@redhat.com>
References: <20260817134538.924615-1-pbonzini@redhat.com>
Date: Mon, 17 Aug 2026 23:45:21 +0400
Message-Id: <178699592135.3562558.2212221233581901915.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=507;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=kzyCoe6FolZeCvSZjPWwoDINhdLV7a4K+y7ltOZMr5c=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqg2TUpYzGk04CmJ9G/NxS+bJZoQNiGQbrVofKr
 cHygItkqX+JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCaoNk1AAKCRDa6OEJdZac
 5SR/D/9T+sFO+lcY6btQkPNPj0ZHkqOdsFKWl50QOomws7k2pbKx9J1sedmHpDGVSjBGPgHSI7x
 qesV6Ag2MPBeDfnZs9N+7l0aXXGBcGJXL/GqDminZCF44Z7a9JqHz122+mAOB1B32ahYeKsrPBm
 A6UtPCNgJBSEiVHD+BMV0S6MKUoWivjWE/6jE0vXH2poEzpTZUbBYVOzsUhe+VUJA6FPA9Rmnak
 gwLAL1ntT1gKYF+BA//L8vlH+n4OU2uhx1wavjM83Ab6fsKZi/bJ419TmwdNj2wT9YIojMgawVI
 NBKtP8sZ2BXv7JeUZmaKme9O5AFrGvpd0SOVp6Z0+L1dJKaeRyzKx1bpipefZKzVz77nUeH53iq
 +nnXSss0K9yt6PBCvaQH+scBjbUys9kaIR8uyEJ+7OXdFqcJhMJcylEXRera5uDFwEh5tCgI+cp
 fR9txsUDUfTysqKskKvBa1/G+YX2Jolva+dHfvgL9k09fl+8d5A15OqcJqPrOcdEFdZyAocRbDt
 wypknFv3/svAHsOFPIrOk22VXOFQq03wfkHXr9IlKGDbpXP6YwUdmcWhIFD+7utsA310U1HRX7t
 akeT0j2hDUP6bTGSGUjHbmbNO9XGzbZENSocfVTyYWRIO6MFT8ut4OIcQGp94Qw6P54zyRfpHOR
 ocOID93jAK3i9Ng==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: vDBGLPd4_glZGI2lN3vzszjbbPCjrol9-Rb07omwlhc_1786995929
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 17 Aug 2026 15:45:28 +0200, Paolo Bonzini <pbonzini@redhat.com> wrote:
> First batch of Rust changes for QEMU 11.2
> 
> This finally brings in a version of Meson where Cargo subprojects are
> powerful enough to remove large parts of QEMU's handwritten build rules
> of scripts/rust/rustc_args.py.  In particular this includes the following
> Meson features
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


