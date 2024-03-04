<?php

namespace Support\Providers;

use Domain\PlatformNotification\Provider\PlatformNotificationProvider;
use Domain\Quiz\Providers\QuizProvider;
use Domain\Carousel\Providers\CarouselProvider;
use Domain\Certificate\Providers\CertificateProvider;
use Domain\ClassDoubt\Providers\ClassDoubtProvider;
use Domain\Community\Providers\CommunityProvider;
use Domain\Course\Providers\CourseProvider;
use Domain\CustomHtml\Providers\CustomHtmlProvider;
use Domain\Deliverable\Providers\DeliverableCourse;
use Domain\Deliverable\Providers\DeliverableLessonProvider;
use Domain\Deliverable\Providers\DeliverableModuleProvider;
use Domain\Deliverable\Providers\DeliverableRuleCacheProvider;
use Domain\Gamification\Providers\GamificationProvider;
use Domain\Invite\Providers\InviteProvider;
use Domain\Lesson\Providers\LessonProvider;
use Domain\Module\Providers\ModuleProvider;
use Domain\MultiDescriptionClasses\Providers\MultiDescriptionClassesProvider;
use Domain\Platform\Providers\PlatformProvider;
use Domain\MagicLink\Providers\MagicLinkProvider;
use Domain\Product\Providers\ProductProvider;
use Domain\SubscriptionPackage\Providers\SubscriptionPackageProvider;
use Domain\PushNotification\Providers\PushNotificationProvider;
use Domain\User\Providers\UserProvider;
use Illuminate\Support\ServiceProvider;
use Support\Interfaces\BaseRepositoryInterface;
use Support\Repositories\BaseRepository;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->bind(BaseRepositoryInterface::class, BaseRepository::class);
        $this->app->register(UserProvider::class);
        $this->app->register(DeliverableCourse::class);
        $this->app->register(DeliverableModuleProvider::class);
        $this->app->register(DeliverableLessonProvider::class);
        $this->app->register(DeliverableRuleCacheProvider::class);
        $this->app->register(LessonProvider::class);
        $this->app->register(ModuleProvider::class);
        $this->app->register(PlatformProvider::class);
        $this->app->register(CommunityProvider::class);
        $this->app->register(GamificationProvider::class);
        $this->app->register(CourseProvider::class);
        $this->app->register(CarouselProvider::class);
        $this->app->register(CustomHtmlProvider::class);
        $this->app->register(ProductProvider::class);
        $this->app->register(InviteProvider::class);
        $this->app->register(PushNotificationProvider::class);
        $this->app->register(CertificateProvider::class);
        $this->app->register(MagicLinkProvider::class);
        $this->app->register(SubscriptionPackageProvider::class);
        $this->app->register(ClassDoubtProvider::class);
        $this->app->register(MultiDescriptionClassesProvider::class);
        $this->app->register(QuizProvider::class);
        $this->app->register(PlatformNotificationProvider::class);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
