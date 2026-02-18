Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEFBE9A04B
	for <qemu-rust@archiver.kernel.org>; Wed, 18 Feb 2026 19:25:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vsnAj-0007T0-Ng; Wed, 18 Feb 2026 14:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1vsnAd-0007RC-RK
 for qemu-rust@nongnu.org; Wed, 18 Feb 2026 14:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1vsnAX-0006PP-7w
 for qemu-rust@nongnu.org; Wed, 18 Feb 2026 14:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771442703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a8NDtYTjUDZ/Bj7KaoMHzFUIc0DWuO6DcVaN0u9ZpgE=;
 b=VkvvXtT1zpeziJ+NdNK4hWtiOj28Z0CgX8zYKQlLgEzHmqNxo/72t76WqjHe0Tk3tJHonJ
 GWM5g8GPvoT+ltB3ECTy1NipdFo9uN5LCQJR/YEntMoaI1Bma0jpWQtzojA4P0BVYwOc83
 iHW8YEU2byPDXvPqhhBcuJYUXyKOdRY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-BUGQtmHhMjWrLNOrkuiMaA-1; Wed,
 18 Feb 2026 14:25:00 -0500
X-MC-Unique: BUGQtmHhMjWrLNOrkuiMaA-1
X-Mimecast-MFC-AGG-ID: BUGQtmHhMjWrLNOrkuiMaA_1771442699
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 34EE31955D42; Wed, 18 Feb 2026 19:24:59 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.65.233])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C44D91956095; Wed, 18 Feb 2026 19:24:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 0/1] rust: use checked_div()
Date: Wed, 18 Feb 2026 14:24:43 -0500
Message-ID: <20260218192444.658046-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: cgDy00_NCqLH9DMeDx1h3WLcABxQIYjGJnocEH4xr3E_1771442699
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.043,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

When upgrading from Fedora 41 to Fedora 43 for our CI tests, (Which I do in=
=0D
https://patchew.org/QEMU/20260216212952.420120-1-jsnow@redhat.com/),=0D
clippy begins complaining about not using checked_div instead of=0D
manually checking divisors; see https://gitlab.com/jsnow/qemu/-/jobs/131691=
93931=0D
=0D
This patch aims to make Clippy happy and prevent any regressions caused=0D
by the lcitool refresh.=0D
=0D
(Tested only via GitLab CI, and I am not exactly a rust wizard...)=0D
=0D
John Snow (1):=0D
  rust: use checked_div to make clippy happy=0D
=0D
 rust/hw/core/src/qdev.rs | 14 ++++++--------=0D
 1 file changed, 6 insertions(+), 8 deletions(-)=0D
=0D
--=20=0D
2.53.0=0D
=0D


